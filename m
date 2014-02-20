From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Feb 2014 15:48:17 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
In-Reply-To: <CAAXf6LWybp29EWQM6AsTPJ0r=PS1AYfU6ZmkYm3jEutxoZ8LEg@mail.gmail.com>
References: <20140220095550.GA16493@pc-eric>
 <CAAXf6LXRsk=roB4ogDfjcHwPZKB2YCUraR34bV3qi72ewuvK1A@mail.gmail.com>
 <CAHkwnC-LRM1oVjxH1PNMHnB9x-H6C7QsO458t01TBtiFr2moOg@mail.gmail.com>
 <CAAXf6LWybp29EWQM6AsTPJ0r=PS1AYfU6ZmkYm3jEutxoZ8LEg@mail.gmail.com>
Message-ID: <530615B1.1000205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/02/14 15:28, Thomas De Schampheleire wrote:
> Hi Fabio,
> 
> On Thu, Feb 20, 2014 at 3:13 PM, Fabio Porcedda
> <fabio.porcedda@gmail.com> wrote:
> [..]
>>
>> Yes, it's a thing to fix for proper parallel bulding support, it's on
>> my todo list.
>>
>> The targets target-finalize, target-purgelocales,
>> target-generatelocales, toolchain-eclipse-register can be executed in
>> parallel after building the generic targets?
> 
> Since you can select both purgelocales and generatelocales, I would
> expect they need to be sequential: first purge then generate (as done
> today).

 True.

> I'd also expect that target-finalize should be finished before
> starting the locale stuff, as the post-build script or overlay may add
> additional locale stuff that needs to be purged.

 Hm, I would actually expect the reverse: whatever my post-build script
or overlay does should be final, and not be removed again by
purgelocales. But that is in fact not what happens at the moment.

 Regards,
 Arnout

> 
> Best regards,
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
