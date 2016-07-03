From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 11:54:28 +0200
Subject: [Buildroot] wget download: 'scheme missing' results in empty
 output file
In-Reply-To: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
Message-ID: <20160703115428.24dad374@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 14:19:56 +0100, Thomas De Schampheleire wrote:
> Hi Yann, all,
> 
> When a package does not (by error) define FOO_SITE, and the source
> archive is not already present, the wget download helper will be
> invoked with as URL /foo-xxx.tar.gz. wget reports 'Scheme missing' and
> bails out, but _returns with a successful error code (0)_.
> 
> As a result, the download helper happily continues with hash checking
> and finally with the atomic mv of the temporary download file (which
> has been created but is still empty) to the final output location.
> 
> Because as far as the download helper is concerned, everything went
> successfully, also the build continues (but obviously fails further
> on).
> 
> While I think wget should not return 0 on such a problem, I think we
> should try and prevent such problems. One way is to expect the
> downloaded file size to be greater than 0. If that requirement is not
> met, the download helper should bail out.
> 
> A patch like the below fixes the problem:

Instead of this, I just submitted a patch that verifies that SITE is
not empty if SOURCE is not empty. See
https://patchwork.ozlabs.org/patch/643725/. Consequently, I've marked
your patch as Superseded in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
