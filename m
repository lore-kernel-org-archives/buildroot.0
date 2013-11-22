From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Nov 2013 17:01:46 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LXhpjMho2gtBaigDD3Z2jxED24jP2xFG9TgG1LT=ahYBA@mail.gmail.com>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
 <CAAXf6LVb6KPe3xPG-Oia6O8NtJ64uD7oNrP4VXS3SM7cpkWe5Q@mail.gmail.com>
 <CAAXf6LXhpjMho2gtBaigDD3Z2jxED24jP2xFG9TgG1LT=ahYBA@mail.gmail.com>
Message-ID: <528F7FEA.2060401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/13 13:59, Thomas De Schampheleire wrote:
> Hi,
>
> On Fri, Nov 22, 2013 at 11:42 AM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Hi Thomas,
>>
>> Thanks for the analysis!
>>
>> On Fri, Nov 22, 2013 at 9:14 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> [..]
>>>>    mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/bcff4b81bfbb1191f97317b0945c74d948c9774b/
>>>
>>> checking whether to build with BeeCrypt library... no
>>> configure: error: mandatory BeeCrypt library not found
>>> make: *** [/home/test/test/3/output/build/rpm-5.2.0/.stamp_configured] Error 1
>>>
>>> rpm has a dependency on beecrypt, so normally it should have been built
>>> before. Seems like rpm isn't "seeing" that beecrypt is around :-)
>>
>> I will look into this...
>
> The problem is that rpm uses beecrypt, and beecrypt depends on openmp
> (libgomp), but the test in rpm does not include -lgomp.
>
> I found a few references to this problem in older threads:
> http://lists.busybox.net/pipermail/buildroot/2012-October/059839.html
> http://lists.busybox.net/pipermail/buildroot/2012-November/061560.html
>
>  From these threads, there is a suggestion to disable openmp in
> beecrypt (from you, ThomasP, actually). I haven't tried it yet, but it
> sounds like this would solve the above autobuild problem.
>
> Any input on this?

  I completely agree with the idea.  Should be a matter of adding 
--disable-openmp to BEECRYPT_CONF_OPT.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
