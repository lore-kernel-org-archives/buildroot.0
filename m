From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:41:19 +0100
Subject: [Buildroot] [PATCH] libiio: Disable MATLAB Bindings on Target
In-Reply-To: <1489433702-3044-1-git-send-email-mfornero@mathworks.com>
References: <1489433702-3044-1-git-send-email-mfornero@mathworks.com>
Message-ID: <20170314234119.73e00147@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 15:35:02 -0400, Matthew Fornero wrote:
> If building on a machine with MATLAB installed, the MATLAB bindings will
> default to ON, which is not the desired behavior for a cross build.
> 
> The bindings are designed to be called from within MATLAB, and we are
> not currently running MATLAB on buildroot-generated targets.
> 
> This does not preclude the use of the bindings from a host connecting
> over the network backend (assuming libiio on the host has the bindings
> enabled).
> 
> Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
> ---
>  package/libiio/libiio.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, after slightly tweaking the commit title. Thanks!

Peter: perhaps we want this for the LTS branch? Not sure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
