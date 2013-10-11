From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Oct 2013 14:15:57 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
	toolchain
In-Reply-To: <20131011141119.7d87610d@skate>
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be> <20131010095744.5690a242@skate>
 <5257BE84.5020901@lucaceresoli.net>
 <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
 <20131011112938.16a751d7@skate> <878uy0un36.fsf@dell.be.48ers.dk>
 <20131011122355.791e8810@skate>
 <CAAXf6LVKr0DPT1U2GuTqdSGAyMGEAdDGF6Uo0PYeb4gGLmg9wQ@mail.gmail.com>
 <874n8ouivj.fsf@dell.be.48ers.dk> <20131011141119.7d87610d@skate>
Message-ID: <CAAXf6LU22crjgist0QpFxAGP=DECKjzRj-+2xccBgyxDtWTUfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 11, 2013 at 2:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Fri, 11 Oct 2013 13:50:08 +0200, Peter Korsgaard wrote:
>
>>  Thomas> Of course, we still have to decide whether we want gcc 4.8, 4.7, and
>>  Thomas> 4.6, or rather larger jumps like
>>  Thomas> gcc 4.8, 4.4, 4.0 or something like that.
>>
>> As we support each individual 4.x version between 4.3 and 4.8 for the
>> internal toolchain (+/- odd architectures) and Linaro is pretty leading
>> edge, I would say 4.6 -> 4.8.
>
> This still doesn't solve the case where Linaro 2013.11 would jump from
> the next eglibc version, but keeping the same gcc version, for example.

It wouldn't solve that case, but maybe it doesn't matter to us. If the
Linaro project co-names their toolchains based on date + gcc, then we
can limit us to that. We then accept whatever eglibc version they
select for that release.

If a user wants to stick to a given eglibc and gcc version, and Linaro
updates eglibc without updating gcc, then that user will have to do
something special. I think it's not realistic for us to handle this in
a clearer way than Linaro does, except by providing a 'custom version'
option.

Best regards,
Thomas
