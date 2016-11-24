From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 21:16:32 +0100
Subject: [Buildroot] [PATCH 1/2] ti-cgt-pru: add package for PRU Host
 toolchain
In-Reply-To: <20161124164420.792cab0f@free-electrons.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <20161124164420.792cab0f@free-electrons.com>
Message-ID: <4b6253ab-7288-eab2-9cca-92b6504c72f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-11-16 16:44, Thomas Petazzoni wrote:
>> +# Since this is largely prebuilt toolchain and likes to live in its own
>> > +# directory, put is in $(HOST_DIR)/ti-cgt-pru_$(CGT_PRU_VERION)
>> > +# Packages wanting to use this toolchain need to use this path as TI's
>> > +# standard PRU_CGT path.
>> > +
>> > +PRU_CGT = $(HOST_DIR)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)
> I'd think I'd prefer:
> 
> TI_PRU_CGT = $(HOST_DIR)/usr/share/ti-cgt-pru/

 But the variable should be named TI_CGT_PRU_DIR (the package is called
ti-cgt-pru, and it's a directory). I completely agree with the value, however.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
