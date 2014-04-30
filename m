From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Apr 2014 07:19:19 +0200
Subject: [Buildroot] Patchwork cleanup #8: submitter notification
In-Reply-To: <20140429210905.GE3248@free.fr>
References: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
 <20140429210905.GE3248@free.fr>
Message-ID: <536087D7.2030100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/14 23:09, Yann E. MORIN wrote:
> Thomas, Angelo, All,
> 
> On 2014-04-29 21:48 +0200, Thomas De Schampheleire spake thusly:
> [--SNIP--]
>> For this cleanup session, here are the patches:
> [--SNIP--]
>> package/makedevs: add "l" type for symlinks ownership change
>> angelo dureghello <angelo70@gmail.com>
>> http://patchwork.ozlabs.org/patch/283015
>>
>> C unsure: Angelo: could you describe in more detail if you are still
>> using this patch, and why you need it? How come the symbolic link does
>> not have the right ownership from the start?
> 
> Note that ownership and permissions of symlinks are never checked, only
> those of the pointed-to entity (file, dir...) are.

 Except for directories with mode 1777. From man 7 symlink:

The only time that the ownership of a symbolic link
matters is when the link is being removed or renamed in a directory
that has the sticky bit set (see stat(2)).

 I find it hard to construct a use case, but I can imagine there is one.
It would indeed be good if this were documented in the commit log.

> Setting ownership of symlinks should not generally be a concern.
> 
> However, I can se one case where we would want to be able to set
> ownership and/or permissions on a synlink: to avoid the identity of the
> "builder" to seep down into the generated filesystem. But even in that
> case, only the numerical UID would end up in the generated filesystem,
> so it is not really a concern.

 That argument is void, since everything is already chown root:root.


> So, I can't really understand what the underlying problem is.
> 
> Angelo, we need you to explain the issue you are facing, so we understand
> why you believe this change to be needed.
> 
> (Note: a proper commit message would do just that: describe the observed
> problem, explain the underlying reason it behaves that way, introduce
> and explain the proposed fix. See for example cset 86c3244 "wget: fix
> host-gettext build dependency race" for a real-world example.)

 +1


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
