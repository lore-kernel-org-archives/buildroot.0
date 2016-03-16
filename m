From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 16 Mar 2016 14:08:27 -0700
Subject: [Buildroot] user: openssh build question
In-Reply-To: <87r3fa6enu.fsf@dell.be.48ers.dk>
References: <CAJJ6jxusP5Q2AuX3WXH8yBu8rakt-mhnk4xU+1cQX_JkL1hg1Q@mail.gmail.com>
 <87r3fa6enu.fsf@dell.be.48ers.dk>
Message-ID: <CAJJ6jxv_xCZy8YUB=r2em0SdoBHjM8G4EPpevJ8WzKe5sW5UmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 16, 2016 at 12:54 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:
>
>  > Hi,
>  > Does anyone know why the build litters my target /etc directory with
>  > files instead of putting them in ssh? I think I must have something
>  > configured wrong. I have upgraded to buildroot 2016.02.
>
> What is your config? Do you use a rootfs overlay?
>
>  > here is the /etc dir, see the generated keys at the end. I think they
>  > should be put in ssh:
>
>  > Thanks, Steve
>
>  > ls -1 output/target/etc/
> [snip]
>  > ssh
>  > ssh_host_dsa_key
>  > ssh_host_dsa_key.pub
>  > ssh_host_ecdsa_key
>  > ssh_host_ecdsa_key.pub
>  > ssh_host_ed25519_key
>  > ssh_host_ed25519_key.pub
>  > ssh_host_key
>  > ssh_host_key.pub
>  > ssh_host_rsa_key
>  > ssh_host_rsa_key.pub
>  > ssl
>
> We don't generate ssh host keys at build time, but only at (first) boot
> in the /etc/init.d/S50sshd init script, so I wonder where you got these
> from?
>
Good question. It was a stupid error. I had pasted the files there
into my external skeleton.  I was trying to avoid the annoying ssh
complaints about keys changing. So I put them in the wrong folder!

Thank you, that fixed it.

Steve
