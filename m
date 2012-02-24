From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Feb 2012 11:43:51 -0300
Subject: [Buildroot] Lua and other scripting languages
In-Reply-To: <b418a9755f30c9a13ae07bb03f87873f@zacarias.com.ar>
References: <CALo-6+ipF1Eqhu92ro+gbsKThou6HEmT97jn57=o3Q7e0y_djA@mail.gmail.com>
 <b418a9755f30c9a13ae07bb03f87873f@zacarias.com.ar>
Message-ID: <7ce86eca5503951b574d0f740b5f7ba0@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-24 11:24, Gustavo Zacarias wrote:
> On 2012-02-23 20:31, Charles Krinke wrote:
>
>> I am working with buildroot and a powerpc 8321 and have a question
>> about Lua. I can select it and compile it into the rootfs.jffs2, but
>> when run, it says "lua: table index is Nan" and I am told this has 
>> to
>> do with soft float not being supported in Lua.
>>
>> Is there a way to get Lua to work in a MPC8323 environment. A follow
>> on question is if there are any pitfalls to be expected with the 
>> other
>> scripting languages microperl, php, python, tcl or ruby.
>
> I'm using it on a MPC8315, which is basically the same processor,
> without any issues.
> Maybe some toolchain snafu?
> In my case it's internal with uclibc-0.9.33, gcc-4.6.2 and
> binutils-2.22 optimized for an e300c3 core.
> All of this would amount to hard float.
> Any special test case to trigger it or just starting up lua?
> Regards.

Crazy man answers to his own mail... ;)
Ok, the mpc8323 is e300c2 which lacks hard float, so make sure you:
* Select e300c2 core
* Select BR2_SOFT_FLOAT
* -msoft-float is in BR2_TARGET_OPTIMIZATION

And try again if not, and let us know.
