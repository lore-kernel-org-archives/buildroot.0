From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 09:33:04 +0200
Subject: [Buildroot] Startup files numbering policy
In-Reply-To: <1386188598.1025471.1369174120221.JavaMail.root@advansee.com>
References: <1882993282.1023650.1369164262752.JavaMail.root@advansee.com>
 <430640706.1023684.1369164662782.JavaMail.root@advansee.com>
 <20130521221707.64d0815d@skate>
 <537887127.1024616.1369170640439.JavaMail.root@advansee.com>
 <20130521232448.27502768@skate>
 <1386188598.1025471.1369174120221.JavaMail.root@advansee.com>
Message-ID: <20130522093304.3b74f29e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Wed, 22 May 2013 00:08:40 +0200 (CEST), Beno?t Th?baudeau wrote:

> Maybe. This is what I had done. I mostly wanted to know if you would add a
> mechanism for that, which you answered. E.g., PTXdist has a config option with a
> default value giving the file name to use for each startup script.

I'm not sure we want to have a config option for each and every init
script. Especially since with systemd, you have a unit file rather than
an init script, so we would have to handle this as well.

I think having a default sane numbering is good enough, since we allow
the users to customize whatever they want using post-build scripts.

Note that I'm not saying the current numbering is perfect, it could be
clarified, with a bit documentation saying "from number X to Y, it's
basic services that are not network dependent", "from Y to Z, it's this
type of services, etc.". I'm just talking about the general approach of
just having a default numbering, and leaving the rest of the
customization to post-build scripts.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
