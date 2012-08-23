From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 23 Aug 2012 18:33:38 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
 when building linux-pam package
In-Reply-To: <50369EFA.5010708@mind.be>
References: <1345001603-16774-1-git-send-email-golubovsky@gmail.com>
 <1345001603-16774-2-git-send-email-golubovsky@gmail.com>
 <50369EFA.5010708@mind.be>
Message-ID: <CADiAo4L9v-f-1_SHx6f0xEiZkTO0rLu_qWyh7N+PAyzPVfGDDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, Aug 23, 2012 at 5:22 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  We normally hard-code the directory name: the build is always executed from
> the buildroot directory, and the package directory normally doesn't change.
> So:
>         cp package/linux-pam/default $(TARGET_DIR)/etc/pam.d
> This will also allow you to do it in the post-install hook.

I try to avoid any hardcoding. Would it be better to make RAWNAME also
available at the install phase?

>
>  Also, I would use $(INSTALL) instead of cp (but that's personal preference,
> cp is used in other places as well):
>         $(INSTALL) -D -m 0644 package/linux-pam/default
> $(TARGET_DIR)/etc/pam.d/default
> (since it uses -D, the mkdir can be removed).

Thanks for the suggestion. I hope to also get Thomas' opinion and if
there are further improvement suggestions I'll try to incorporate
yours as well.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
