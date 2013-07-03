From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 2 Jul 2013 22:46:19 -0600
Subject: [Buildroot] [PATCH] system: only set the root password if it's
 not empty
In-Reply-To: <20130702173111.GA3221@free.fr>
References: <20130702085224.GA25620@berrier.lan>
 <20130702173111.GA3221@free.fr>
Message-ID: <20130703044618.GA4406@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Jul 02 19:31, Yann E. MORIN wrote:
> Wade, All,
> 
> On 2013-07-02 02:52 -0600, Wade Berrier spake thusly:
> > No need to replace the password in etc/shadow with a blank password.
> 
> How do you differentiate between those two cases:
>   - use an empty password,
>   - do not change the existing password?
> 
> My opinion is that we do want to be able to set an empty pasword,
> especially in the case of a custom skeleton. This makes it systematic,
> so the user knows what to expect.

If that's desired, then yes, my patch isn't a good solution.

> 
> If you want to not use the config option to handle the root password,
> then you can use either:
>   - a post-build script, or
>   - a skeleton overlay.
> 
> (If I read the Makefiles correctly, skeleton overlays are handled during
> target-finalize, which is called after target-root-passwd, so the
> overlay should take precedence over the root password option. To be
> confirmed...)

I guess one real issue is that mkpasswd on redhat fails and returns an empty
hash, which is inserted into the shadow file.

Maybe the thing to do to work across distros would be to compile the correct
mkpasswd as a host- package?

In the meantime I think your suggestions of using a custom overlay or post build
script should work great.

Thanks,

Wade
