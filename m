From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 12:02:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2020f
In-Reply-To: <CANLo3Jg36L0iySAh+UpDV=zg_qKgVdeDVAyrQSdeRKNXM7q0kA@mail.gmail.com>
 (Romain Naour's message of "Mon, 15 Feb 2021 10:34:36 +0100")
References: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
 <20210110164711.1708062-2-bernd.kuhls@t-online.de>
 <87zh1ekq9r.fsf@dell.be.48ers.dk>
 <19dff490-6537-bc7d-7035-e4bd99f97452@gmail.com>
 <877dnad5ux.fsf@dell.be.48ers.dk>
 <602ba0f2-503c-7175-c4fb-7dcac246631c@gmail.com>
 <8735xyd2vs.fsf@dell.be.48ers.dk> <20210214182145.GH6798@piout.net>
 <8c8b3bb9-0179-b194-1ad3-98cdd55ff4b3@gmail.com>
 <20210214203543.GA2945341@scaer> <87h7mdbsot.fsf@dell.be.48ers.dk>
 <CANLo3Jg36L0iySAh+UpDV=zg_qKgVdeDVAyrQSdeRKNXM7q0kA@mail.gmail.com>
Message-ID: <878s7pbnl4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> It is also not clear to me exactly when the slim format support was
 >> added to glibc, but as additional datapoints, I have it working with a
 >> 2.30 based toolchain built by 2020.02.x and a 2.31 based one built by
 >> 2020.11.x.
 >> 

 > Actually we have the same issue with Bootlin
 > armv5-eabi--glibc--bleeding-edge-2018.02-1 that use glibc 2.27 (tzcode
 > 2017b).
 > There is no problem with glibc-2.28 (tzcode 2018g)

 > https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/fragments/armv5-eabi--glibc--bleeding-edge-2018.02-1.frag

Ahh, good catch. Then it is probably because of the addition of:

commit fc79706a3233b02909b1a75b1e43e40915eb5a04
Author: Florian Weimer <fweimer@redhat.com>
Date:   Fri May 11 16:30:30 2018 +0200

    time: Use 64-bit time values for time zone parsing

-- 
Bye, Peter Korsgaard
