From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 19 Oct 2007 10:36:36 +0200
Subject: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails to
	build due to missing execinfo.h
References: <e73b1f587b0c993034a1396b7e2cc5d3@bugs.uclibc.org>
	<47188770.1070704@promwad.com>
Message-ID: <00db01c8122b$71720290$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Kuten Ivan" <ivan.kuten@promwad.com>
To: <buildroot@uclibc.org>
Sent: Friday, October 19, 2007 12:31 PM
Subject: Re: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails to 
build due to missing execinfo.h


> bugs at busybox.net wrote:
>> The following issue has been SUBMITTED.
>> ======================================================================
>> http://busybox.net/bugs/view.php?id=1543
>> ======================================================================
>> Reported By:                hmoffatt
>> Assigned To:                buildroot
>> ======================================================================
>> Project:                    buildroot
>> Issue ID:                   1543
>> Category:                   Architecture Specific
>> Reproducibility:            always
>> Severity:                   major
>> Priority:                   normal
>> Status:                     assigned
>> ======================================================================
>> Date Submitted:             10-19-2007 01:21 PDT
>> Last Modified:              10-19-2007 01:21 PDT
>> ======================================================================
>> Summary:                    gcc 4.1.2 libmudflap fails to build due to 
>> missing
>> execinfo.h
>> Description:
>> During the gcc-4.1.2-final build, libmudflap files to compile due to
>> missing execinfo.h. configure detects that execinfo.h exists but is
>> unusable, but that's because it used the wrong cpp and found the host
>> version instead.
>>
>> The fix is to pass CPP=<target_cpp>, as in the attached patch.
>> ======================================================================
>>
>> Issue History
>> Date Modified   Username       Field                    Change
>> ======================================================================
>> 10-19-07 01:21  hmoffatt       New Issue
>> 10-19-07 01:21  hmoffatt       Status                   new => assigned
>> 10-19-07 01:21  hmoffatt       Assigned To               => buildroot
>> 10-19-07 01:21  hmoffatt       File Added: br-gcc412-cpp-fix
>> ======================================================================
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>
> Hi hmoffatt,
>
> Is that bug specific to "gcc-4.1.2 + oabi + soft float" configuration?
> Because I remember to build&run all correctly with "gcc-4.1.2 + eabi + no 
> soft float".

The patch affects soft-float only, but is currently only in the 4.2.1 
subdir.

Best Regards
Ulf Samuelsson 
