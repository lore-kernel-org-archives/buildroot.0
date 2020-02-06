From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Feb 2020 21:22:32 +0100
Subject: [Buildroot] Kconfig warnings with GCC9
In-Reply-To: <CAGt4E5vMQgJKAKfFgr7oUmMJjyDufB72L7VVUgS-UGg8g6c+_A@mail.gmail.com>
References: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
 <20200110215652.291df299@windsurf>
 <CAGt4E5u+KA3Vi0dp+YRAYnvXSJN1XXF=S86Th4NoyamnQSWpiw@mail.gmail.com>
 <87a76ujsuv.fsf@dell.be.48ers.dk>
 <CAGt4E5s9k2ypwQ5MXBpQA=Wf_W8SMN4u_DvXJtDeJeR0-9H0Eg@mail.gmail.com>
 <CAGt4E5vMQgJKAKfFgr7oUmMJjyDufB72L7VVUgS-UGg8g6c+_A@mail.gmail.com>
Message-ID: <20200206212232.5262c903@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Thu, 6 Feb 2020 10:30:28 -0800
Markus Mayer <markus.mayer@broadcom.com> wrote:

> > That's kernel 5.4. Kconfig itself complains about a few Kconfig values
> > for my stock kernel (maybe because that's 5.3?), but the compiler is
> > fine. So we should be good.  
> 
> Okay. I poked around some more. Turns out that kconfig on the Linux
> side changed *a lot* between 4.17-rc2 and 5.5. Many files were
> renamed. A good number of functions was rewritten (partially precisely
> to avoid the format-overflow warnings). The easiest approach might
> just be to take the Linux kconfig implementation as is and re-apply
> the Buildroot customizations on top of the new implementation rather
> than trying to merge in all the changes from Linux and risking
> breakage by doing that incorrectly.

This easiest approach is what we do every time we update the Kconfig
code in Buildroot.

> Is there an easy-ish way to see all the customizations that Buildroot
> did to kconfig over the years (excluding code changes imported from
> Linux during past kconfig upgrades)?

See support/kconfig/patches/ and support/kconfig/README.buildroot.

Looking forward to the bump of our Kconfig code base!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
