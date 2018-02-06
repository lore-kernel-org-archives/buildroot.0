From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 23:15:14 +0100
Subject: [Buildroot] [PATCH 1/4] openjdk: new package
In-Reply-To: <20180206145203.GD20598@australia.be.alcatel-lucent.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
 <20180206143952.12332-2-thomas.de_schampheleire@nokia.com>
 <20180206145203.GD20598@australia.be.alcatel-lucent.com>
Message-ID: <29b7df93-fa74-d453-aa0f-7d21a33ed719@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 15:52, Thomas De Schampheleire wrote:
> 
> Note: I also added following lines in the top-level Buildroot Makefile to avoid
> interference from the user's environment:
> 
> unexport PLATFORM
> unexport JAVA_HOME
> unexport OS

 You can achieve this locally by adding...

[snip]
>> +OPENJDK_MAKE_ENV += X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes \
>> +		    PULSE_NOT_NEEDED=yes \
		PLATFORM= JAVA_HOME= OS= \
>> +		    BUILD_LD="$(HOSTCC)"


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
