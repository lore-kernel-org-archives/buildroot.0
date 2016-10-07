From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Oct 2016 09:20:53 -0700
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <20161007142118.657d18ee@free-electrons.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
 <20161005172756.77aea89c@free-electrons.com>
 <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
 <20161005221619.6a958ba0@free-electrons.com>
 <b6d8768f-9192-6e0a-0299-36584151f4e7@gmail.com>
 <CAAXf6LX5+csACE8dRjdL+ue-JYpGbCsHZDjQ=KOuaESuoehgDA@mail.gmail.com>
 <CAAXf6LWaBL_cifwis=3Y1NYLMgt0m1=eOmb99UqGyzgxF7FikQ@mail.gmail.com>
 <20161006213626.5147dc08@free-electrons.com>
 <CAAXf6LUwubkNu9+25LUZyOMchdFfHjYUa5pzdfOF9xYfjzWamA@mail.gmail.com>
 <CAAXf6LXcZ2BOc+znu6GQFX3oC=LVAYO=inYGwk83JKHRQR2T-g@mail.gmail.com>
 <CAAXf6LUeqZPO=QCcW189s6yvrtMXwvDsFrij0vn8U+tjjULYrw@mail.gmail.com>
 <20161007142118.657d18ee@free-electrons.com>
Message-ID: <16077173-0053-4A97-B519-674A9C7146D1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Oct 7, 2016, at 5:21 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Thu, 6 Oct 2016 21:50:12 +0200, Thomas De Schampheleire wrote:
> 
>> But also, is it possible that you did not see the two questions at the
>> bottom of my mail?
> 
> No, I did not see those questions.
> 
>> 1. What about fixing it in pkg-generic.mk for all packages?
> 
> From a quick grep, it seems like we have 6 packages today that pass
> MAKEINFO=true or MAKEINFO=:, with binutils and gdb that would be 8
> packages. I'm not sure we've reached the point where moving it to the
> common package infrastructure makes sense.

I think for target packages ignoring info files is fine for small
systems and other doc related code like manpages.
for host packages may be it is still useful

> 
>> 2. What about using ':' instead of 'true'?
> 
> I don't really see the difference between the two. I guess ':' is a
> shell built-in, and 'true' is a proper separate command. But I'm not
> sure why we would use one instead of the other.
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161007/8a6485ca/attachment.asc>
