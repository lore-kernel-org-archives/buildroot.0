From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 17:02:05 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <CAPi7W81kEgCx815QZcyewyLim-2F1uPYQTzVXG-xAjpi=hrcxA@mail.gmail.com>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
 <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
 <CAPi7W82WL5MwxnQWri0dg5Ep92fHedomD3XJHLViLGUcr2JwXA@mail.gmail.com>
 <CAPi7W82zbZLPORsXG989MfnFVitVEFELC1FU1GDGk_0n19oMDA@mail.gmail.com>
 <20180628032558.b4bgdv2qdpzssean@tarshish>
 <CAGm1_kuvRh-wam8N-wOyuoyfROc7J_K7FY4SFA55b-Omivmo+g@mail.gmail.com>
 <20180628102352.5a997e68@windsurf.home>
 <CAGm1_kufkaKQ_F=kWy2ihKXq9r6H7bOaNBHoRUfQE89N9-dWYQ@mail.gmail.com>
 <20180628112009.2bf1533a@windsurf.home>
 <CAGm1_kvcW7h4fpw7pEf5pb_RFX9r0HOr2c=Bv94=xAj_CN34Xg@mail.gmail.com>
 <CAPi7W81kEgCx815QZcyewyLim-2F1uPYQTzVXG-xAjpi=hrcxA@mail.gmail.com>
Message-ID: <20180719170205.0c06ccd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 19:25:32 +0200, Fabrice Fontaine wrote:

> Next branch builds fine however it seems there is outstanding issues:
> https://github.com/gnuradio/gnuradio/issues/1842. What should we do until
> an official release is made with python3 support?

In the mean time, I think I will just apply your patch that adds the
"depends on !BR2_PACKAGE_PYTHON3". It's not great, but it's not the
only simple approach to resolve the build failures.

In today's Buildroot, if a package needs host Python modules in the
Python version which is not the default one, this is not supported, and
it will be difficult to support this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
