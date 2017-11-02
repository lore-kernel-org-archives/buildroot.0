From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Nov 2017 22:22:29 +0000
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171031230519.3feb2619@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
Message-ID: <1509661348.7985.34.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, 2017-10-31 at 23:05 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Since Peter is about to release -rc1, it's time to restart with
> analyzing the build failures we have. And we have *lots* of them!
> 
> Alexey, Yann, Adam, Peter (both Korsgaard and Seiderer?, Olivier,
> Matthew, Johan, Angelo, J?rg, Samuel, Waldemar, Bernd and Baruch: there
> are some questions/issues/topics for you below. Please read on! Thanks
> for your support!
> 
> On Tue, 31 Oct 2017 08:00:13 +0100 (CET), Thomas Petazzoni wrote:
> 
> > 
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_25e4ff4b
> > 8cecd88d56bd75fcdef64ad9affed959&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=XUTmUXwkQXl7ItG7N1pAWJWWunjRW1a2hsS1Upv0lWE&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_204d17c6
> > 39e8a38648dbc15c4abbc0c6fe23370a&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=HL8z6zOQffOxiiX1czQjUU8pikqgfTMFgtIBq3G-ixQ&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_2ac87b1e
> > a118366df4c816a13fa7cd02f8b10dc0&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=yBmhKi6AYzEyuO-WaHu0fHqGmzlyJgl3KXWPCl0tsh0&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_a8182305
> > 18d1197a9916019a955437fc3611ad33&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=JMOmKsbn1vTp53Q5q39CsST6KFnNhkFauWdNkyVl_iw&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_3663fc12
> > c6d5908ba496efdfaa1ba24ed39f0104&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=iEcyGr6eFDZ-9hHPX7g1BcysNT5qDxuwBZy4gpsbJXo&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_af51008c
> > dc92645adb20664aa7b3c64d9ed4691e&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=9Uf-zfKhAegRJeyRtrWb3HUvc8dZ901Co6vHy-hwc28&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_e033f008
> > b4731d41ec426884b45a591dda7adaf3&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=K8H84AAU-DHT7MmwR1d5U_pvnGG-REgwVbGh-naaIYA&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_1be95e26
> > fd18e9772e42b5e6cb1e93fbac9c1c8a&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=Knq_fhDUA-YrWC4cXJVWJOOtgnFOgh6J6P2_F6INXi8&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_c94d79b9
> > eaecdb36e0894ae0f965ae39cdb35386&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=UQFmD5p76KTZkmOcBq7d36CJzAehnMuYfRSfnTF2PRk&e= | ORPH
> > ?????????arc |????????????argp-standalone-1.3 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_53359e0f
> > e1408f3816d3091b49462320239f39c1&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=ZzDicS_Crt1xGsB8xZ3Z2tQcu4fKhMo2zqwUvPnwk50&e= | ORPH
> 
> This is happening only on ARC. Why? Matt Weber proposed a patch,
> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.ozlabs.org_patch_832397_&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO
> 7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAueopOxxi907gBc&s=rMdyDsEHNFQ-ca0a1D67Ic1kVPjq4-unagbYg0C6Mok&e=, but I am not terribly
> convinced because it doesn't explain why this problem happens only on
> ARC, and why it appeared suddenly.
> 
> Alexey, could you have a look ?

I think this one should be resolved by now with
https://git.buildroot.net/buildroot/commit/?id=f0b65bd90ce4429d6b7e952ce7de2d5f92a2dd26

> > 
> > ?????????arc |?????????????????busybox-1.27.2 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_2cb531b9
> > f9c75bb5dae10c02f2afeca225c65947&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=Ir0fG31YiZk9D95bMFzGXx7Q2AKRAL-d-Hum3EtXl1s&e= | ORPH
> 
> 
> ? CC??????console-tools/setlogcons.o
> libbb/appletlib.c:206:8: error: 'NUM_APPLETS' undeclared (first use in this function); did you mean 'PF_APPLETALK'?
> ? max = NUM_APPLETS;
> 
> What is going on here?!?

That's a strange one, so far I was not able to reproduce it locally,
but will look at it a bit more next week.

What's especially strange it was the one and only failure on "busybox" package
out of many others that completed successfully, see?http://autobuild.buildroot.net/?reason=busybox-1.27.2

So maybe just forget about it and see how it goes.
What do you think?

> > 
> > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_b8fd41b1
> > 27ab7702a2b69998076d737ea2e092b5&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=irBg_ngSq1BL0E8H8ke9CcAZiMztKusLOzpZqmsGT6Q&e= |?????
> > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_43c90fba
> > d3662101ef4eb5958f73700d1ff57b38&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=BWFrdyvhvf4vtkT4icRZjJWRaRnRqXiZmQrZx3kSYhA&e= |?????
> > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_a152a190
> > 108986392346efbba001b9dd0bdc89bc&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=WXHFzHjT7t0qzy564h8rSXoRhdVBkW38VUWkLh5fOq4&e= |?????
> > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_60d44246
> > fe6a54b02b53564761807204b9a190d0&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=5NaYvqtFNK7_7r2I3FuyzrJnnAcXgOF78PFKW9RbNaw&e= |?????
> 
> libavcodec/vp9dsp_template.c:1685:1: internal compiler error: Segmentation fault
> 
> Alexey, could you have a look ?

This one should be fixed with arc-2017.09-release, see Eugeniy's patch here:
http://patchwork.ozlabs.org/patch/832948/

> > 
> > ?????????arc |?????????????????????gpm-1.20.7 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_5a1404cf
> > 52c9547533a5b04c40d6118b43a07707&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=Jv3gwPg1yH8fq_Iv8OfoLAiijUqkLUJHWh86gCTaceA&e= |?????
> 
> gpm-root.c:(.text.startup+0x1aa): undefined reference to `__sigemptyset'
> gpm-root.c:(.text.startup+0x1aa): undefined reference to `__sigemptyset'
> 
> This is with the new glibc ARC toolchain. Alexey ? :-)

Interesting, I'll look at it soonish.

> > 
> > ?????????arc |???host-gdb-arc-2017.09-rc1-gdb | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_43eae264
> > 991aa369490236c7bd59c0b6a67fcf25&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=Y89IzZE-HfAMONW-pw3Tpzx8pSDDRYJQO0GwD6tvGnU&e= | ORPH
> 
> checking whether /usr/bin/g++ supports C++11 features with -h std=c++11... no
> configure: error: *** A compiler with support for C++11 language features is required.
> make[2]: *** [configure-gdb] Error 1
> 
> The ARC special version needs:
> 
> ????????depends on BR2_HOST_GCC_AT_LEAST_4_8
> ????????depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
> Just like the gdb 8.0 version.
> 
> Yann, perhaps you could have a look at this ?

Yann got this fixed, kudos to you man!

> > ? ? ? ? ?arc |????????????????????libidn-1.33 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_d3c3abf9
> > 966dd023923235c3879f521ba3a2daa5&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=xapCcPSpcJeTqcB8nolmkeAJ46vcjscSHEYykCOVU_g&e= | ORPH
> 
> 
> strerror.c: In function 'rpl_strerror':
> strerror.c:44:21: warning: implicit declaration of function 'strerror_override'; did you mean 'strerror_r'? [-Wimplicit-function-declaration]
> ???const char *msg = strerror_override (n);
> ?????????????????????^~~~~~~~~~~~~~~~~
> 
> This so far only happened on ARC, with uClibc. Alexey ?

I think we saw something similar, let me check what's going on there.

> > ?????????arc |??????????????stress-ng-0.06.15 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_296b1458
> > 4c200593f88af75cdda65c4ca03cd863&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=hZO4_8arB3eZyrTFDhTVVi85JDCAAue
> > opOxxi907gBc&s=Nq4o0HO39fDCbz8RLExATVcmn_x5cdJwIZZl5UqwMm4&e= |?????
> 
> stress-fp-error.c: In function 'stress_fp_error':
> stress-fp-error.c:100:10: error: 'FE_INVALID' undeclared (first use in this function); did you mean 'EINVAL'?
> ????EDOM, FE_INVALID);
> ??????????^~~~~~~~~~
> 
> We already exclude nios2, we should probably exclude ARC as well.
> Alexey, do you confirm?
> 
> See:
> 
> ????????# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
> ????????depends on !BR2_nios2

Let me first see what is that and if something is really missing.
I mean why we don't have?FE_INVALID & friends defined.

-Alexey
