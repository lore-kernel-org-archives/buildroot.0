From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 May 2014 15:52:43 +0200
Subject: [Buildroot] [PATCH] ruby: fix build with recent openssl versions
In-Reply-To: <201405210822.52997.fatih.asici@gmail.com>
References: <1400594769-31393-1-git-send-email-fatih.asici@gmail.com>
 <87k39ggooi.fsf@dell.be.48ers.dk>
 <201405210822.52997.fatih.asici@gmail.com>
Message-ID: <20140522155243.5137c174@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Wed, 21 May 2014 08:22:52 +0300, Fatih A??c? wrote:

> OpenSSL version on my system (Debian Wheezy) is 1.0.1e-2+deb7u9. When
> building host-ruby it fails because of an undefined macro:

Then we should either:

 1) Build host-ruby without openssl support, if it's possible and not
    necessary.

 2) Make host-ruby depend on host-openssl, but that wouldn't be really
    nice.

No? I don't think we have OpenSSL development files as part of the
mandatory requirements to run Buildroot, so we shouldn't rely on them.
I believe option (1) above is possible, because my autobuilders don't
have the openssl development files installed IIRC, but we don't see any
ruby issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
