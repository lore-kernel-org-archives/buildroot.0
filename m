From: Stefan Agner <stefan@agner.ch>
Date: Thu, 25 Mar 2021 17:41:56 +0100
Subject: [Buildroot] [PATCH] package/libbytesize: remove pcre2 runtime
 dependency
In-Reply-To: <20210325163942.7d8ecb69@windsurf.home>
References: <226176cabe249af62546689fbb39de8a7010c329.1616681740.git.stefan@agner.ch>
 <8735wjl3d5.fsf@tarshish> <c1c09133e8e3d70f0458fd0da622062f@agner.ch>
 <20210325163942.7d8ecb69@windsurf.home>
Message-ID: <749f0f6adb5df95c1d0b0b7ad101caae@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-03-25 16:39, Thomas Petazzoni wrote:
> On Thu, 25 Mar 2021 15:40:36 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> Hmm, I think I don't understand how runtime/compile time dependencies
>> work in buildroot.
>>
>> I read this section:
>> https://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages
>>
>> But I think i got this wrong, gettext in that case is only a runtime
>> dependency.
> 
> Yes, and because it's only a runtime dependency, we need to make sure
> it is enabled in the configuration (which the "select" does), but we
> don't need to ensure it is built *before* a certain package (which
> <pkg>_DEPENDENCIES does).
> 
>> Is there a way to have something as compile time dependency but not a
>> runtime dependency?
> 
> No, because it is fairly uncommon to have something that is a compile
> time dependency but not necessary at runtime. Do you have specific
> examples in mind ?
> 
> For example, in your patch, libbytesize links against the libpcre2
> library. So there is a build time dependency, as libpcre2 needs to be
> built before libbytesize, for the link of libbytesize to succeed. But
> there is also a runtime dependency: libpcre2.so needs to be on the
> target.

Oh you are right libbytesize actually links against it. I somehow was
assuming this is a build time dependency only.

Sorry for the noise.

--
Stefan


> 
> Thomas
