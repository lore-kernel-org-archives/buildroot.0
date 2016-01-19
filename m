From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Jan 2016 23:57:46 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <CAAXf6LVSwy5ozhJ4cYrSDF5gXBNEkjEs9ej_L2TkLa5a4avV8g@mail.gmail.com>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 <87lh7l3asr.fsf@dell.be.48ers.dk>
 <CAAXf6LUqCv04ZkCH5fKwq2_0w9hBYFYXM_Bf5t1yawG1D8yeTQ@mail.gmail.com>
 <20160119182947.GB3360@free.fr> <878u3l2z9f.fsf@dell.be.48ers.dk>
 <CAAXf6LVSwy5ozhJ4cYrSDF5gXBNEkjEs9ej_L2TkLa5a4avV8g@mail.gmail.com>
Message-ID: <569EBF6A.4080208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-01-16 20:40, Thomas De Schampheleire wrote:
> 
> On Jan 19, 2016 19:35, "Peter Korsgaard" <peter@korsgaard.com
> <mailto:peter@korsgaard.com>> wrote:
>>
>> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr
> <mailto:yann.morin.1998@free.fr>> writes:
>>
>> Hi,
>>
>> >> I was not aware that glibc already depends on skeleton. Then indeed
>>  >> ThomasP's reasoning is correct and the patch should be simplified. I
>>  >> will investigate that further and resubmit.
>>
>>  > Skeleton is currently not a dependency of host-gcc-initial, so you'd
>>  > have to make it so.
>>
>> Ahh yes, we only add it for target packages.
> 
> I did 'make clean toolchain' on x86-64 qemu defconfig but with glibc, and at the
> end I noticed that skeleton was built and the symlinks were correctly created.
> So which package had the skeleton dependency? (Don't have a buildroot near me ATM)

 glibc is a target package so depends on skeleton (see pkg-generic.mk, search
for skeleton).

 Regards,
 Arnout

> 
> /Thomas
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
