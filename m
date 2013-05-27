From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 May 2013 21:44:19 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <20130527211200.735491c7@skate>
References: <20130523131251.2ffc509f@skate> <51A38EEE.7000406@mind.be>
 <20130527211200.735491c7@skate>
Message-ID: <51A3B793.6050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/05/13 21:12, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 27 May 2013 18:50:54 +0200, Arnout Vandecappelle wrote:

[snip]
>>    The question is whether the OVERRIDE_SRCDIR infrastructure should apply
>> this step or not. Conceptually, it shouldn't, but that means that users
>> of OVERRIDE_SRCDIR for packages that need an autoreconf would need to do
>> the autoreconf manually. Which is probably for the best anyway, but which
>> is a change compared to current behaviour.
>
> For now, I consider doing the prepare step even on OVERRIDE_SRCDIR
> package, even if that means that we are modifying the source directory.

  Given that we've recently accepted some patches that solve problems of 
non-writeable source directories, I don't think this is appropriate. I 
think it's a valid use case to use OVERRIDE_SRCDIR to define the custom 
source of a package, which is located in some shared directory. Having 
random builds modifying that source is not appropriate.

  And now is the time to define this behaviour - changing it later can be 
considered "ABI breakage".

  Regards,
  Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
