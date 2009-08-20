From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Aug 2009 10:52:41 +0200
Subject: [Buildroot] Explicit dependencies on uclibc in makefiles
In-Reply-To: <d6cda7730908130743ic7fa66fy5f32814fc828d887@mail.gmail.com>
References: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
	<d6cda7730908130705s11275a7cu78d2dbca3ee15041@mail.gmail.com>
	<87a5b0800908130719m79b677dbm1e3c12bd9dafddaf@mail.gmail.com>
	<20090813163709.044199e3@hcegtvedt.norway.atmel.com>
	<d6cda7730908130743ic7fa66fy5f32814fc828d887@mail.gmail.com>
Message-ID: <20090820085241.GC22901@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 13, 2009 at 11:43:27AM -0300, Thiago A. Corr?a wrote:
>2009/8/13 Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>:
>> On Thu, 13 Aug 2009 15:19:48 +0100
>> Will Newton <will.newton@gmail.com> wrote:
>>
>> <snipp>
>>
>>> Why does bash depend on uclibc but grep doesn't? Does grep have a bug
>>> or can we remove the unneeded dependency from bash?
>>>
>>
>> IIRC uclibc is earlier in the dependency loop anyway, uclibc is in the
>> BASE_TARGETS list. See top level Makefile.
>>
>
>Ah, ok. I never looked it up at the top Makefile. Well, then I guess
>we could drop uclibc from all packages/*

indeed.

>This actually should be done for the glibc support to work properly I guess.

http://repo.or.cz/w/buildroot.git?a=commit;h=7a1e0eccede82028e176ee4671fe79b1a34c0779
http://repo.or.cz/w/buildroot.git?a=commit;h=567d5c24536c8462b6df24f6c7654a72b00f202d
http://repo.or.cz/w/buildroot.git?a=commit;h=ab606461d9033d8dca2dd698751308d9aa0c528f
http://repo.or.cz/w/buildroot.git?a=commit;h=31cb73c8370d65a2fde86415de59369dc433b02d

and related commits.

As previously stated, i invite anybody to bring your tree up to snuff
