From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:13:59 +0200
Subject: [Buildroot] [PATCH 1/2 v3] toolchain/wrapper: display options
 leading to a paranoid failure
In-Reply-To: <bc84e6b73e8ed3767bfeb120b614dff3818770e7.1472485693.git.yann.morin.1998@free.fr>
References: <cover.1472485693.git.yann.morin.1998@free.fr>
 <bc84e6b73e8ed3767bfeb120b614dff3818770e7.1472485693.git.yann.morin.1998@free.fr>
Message-ID: <20160918161359.0b5121c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Aug 2016 17:53:58 +0200, Yann E. MORIN wrote:
> Current, we only display the path that causes the paranoid failure. This
> is sufficient, as we can fail only for -I and -L options, and it is thus
> easy to infer from the path, which option is the culprit.
> 
> However, we're soon to add a new test for the -isystem option, and then
> when a failure occurs, we would not know whether it was because of -I or
> -isystem. Being able to differentiate both can be hugely useful to
> track down the root cause for the unsafe path.
> 
> Add two new arguments to the check_unsafe_path() function: one with the
> current-or-previous argument, one to specify whether it has the path in
> it or not. Print that in the error message, instead of just the path.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> ---
> Changes v2 -> v3:
>   - invert test to gain one indentation level  (Thomas)
>   - remove stray variables from v1  (Thomas)
>   - add doc to the function  (Thomas)
>   - add a comment about the "' '" trick  (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
