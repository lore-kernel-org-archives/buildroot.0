From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 23:18:52 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171102232155.11995715@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
Message-ID: <ba942bc0-1444-1f44-875e-94dd973d6e09@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 23:21, Thomas Petazzoni wrote:
>>>       xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/bb0a52f08ce07b3aa7301e69e9be12f3e45f45b2 | ORPH
>>>          arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/0b6feb96ba877cb4f3b8c6a05c977a1c12805fac | ORPH
>>>          arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/daa93d58840c77c980d040e2b740555dc3b36951 | ORPH  
>>
>> /home/buildroot/autobuild/run/instance-3/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgobject-2.0.a(libgobject_2_0_la-gmarshal.o): In function `g_cclosure_marshal_VOID__VOID':
>> gmarshal.c:(.text+0x0): multiple definition of `g_cclosure_marshal_VOID__VOID'
>> ../gst/.libs/libgstreamer-0.10.a(libgstreamer_0.10_la-gstmarshal.o):/home/buildroot/autobuild/run/instance-3/output/build/gstreamer-0.10.36/gst/gstmarshal.c:60: first defined here
>>
>> Static linking issue. Who volunteers to have a look? We don't even have
>> a person listed in the DEVELOPERS file for gstreamer.
> Still unfixed. Anyone?

 I don't think anybody is motivated to maintain the now severely deprecated
gstreamer0.10. maybe it's time to remove it? Or at
least, we could remove it from static.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
