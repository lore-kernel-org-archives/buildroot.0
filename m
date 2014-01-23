From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 23 Jan 2014 13:59:41 +0100
Subject: [Buildroot] [PATCH] lua: fix compilation with Blackfin FLAT
In-Reply-To: <87lhy7aq54.fsf@dell.be.48ers.dk>
References: <1390389214-9768-1-git-send-email-francois.perrad@gadz.org>
 <87ob33d8x3.fsf@dell.be.48ers.dk>
 <CAB0FRste2wME45HZCXaCrVD3zB=bJ8mSB6b3wSk5VTQvs8eycQ@mail.gmail.com>
 <87lhy7aq54.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRssis3vYqKjeGPxdXiA2YXM9w0ecXNOqcc+7g3CWH1BJQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:
>
> Hi,
>
>  >> But BINFMT_FLAT imply BR2_PREFER_STATIC_LIB. I guess we should do this
>  >> whenever BR2_PREFER_STATIC_LIB is enabled, right?
>
>  > No, the condition BR2_PREFER_STATIC_LIB is too large.
>  > The tarball Lua contains no Configure script, my patch behaves like
>  > the detection of the presence of the functions dlopen/dlclose/dlsym in
>  > a Configure script.
>  > The purpose of BR2_PREFER_STATIC_LIB as described in its help message
>  > is very different.
>
> Well, I wouldn't call it "very different". The idea is to not use shared
> libraries when PREFER_STATIC_LIB is enabled, so also not
> dlopen/dlclose/dlsym.
>
> What you perhaps mean is that there is a difference between
> architectures (or variants) where we select BR2_PREFER_STATIC_LIB
> because they cannot support shared libraries (and hence have no
> dlopen/dlclose/dlsym), and other situations where the USER just desides
> that they don't want shared libraries, even if the architecture could
> support it.

Yes, BR2_PREFER_STATIC_LIB is mostly a user choice, when
BR2_BINFMT_FLAT is an architecture limitation.

Fran?ois

>
> --
> Bye, Peter Korsgaard
