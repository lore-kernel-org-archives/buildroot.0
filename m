From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 4 Sep 2012 14:03:02 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
 when building linux-pam package
In-Reply-To: <201209041952.39756.yann.morin.1998@free.fr>
References: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
 <201209041902.30271.yann.morin.1998@free.fr>
 <CADiAo4LQysVFknpskVM0Z2nfY_oSB8vUD306X1KYucM_My+kVw@mail.gmail.com>
 <201209041952.39756.yann.morin.1998@free.fr>
Message-ID: <CADiAo4JFrhbUtJ3K4A3kvxD95v5M7H8aDOZVWzmO2KOJH-rx0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Sep 4, 2012 at 1:52 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

>> This patch was a "reasonable compromise" to have a somewhat working
>> system emulating PAM-less behavior when PAM is enabled in login and no
>> proper PAM configs are provided.
>> I think that in a real project, a post-build filesystem fix should
>> replace these files with something more sensible (like mine does).
>
> Ah, OK I get it. With these two files, even if no PAM configuration is
> provided by other means, it would behave as if PAM was not enabled. Right?

Correct: local logins via busybox login (or whatever calls pam_start
with "login" as program name) will be possible for "default" and
"root" (but not any other config) even if /etc/shadow has null
passwords. At least in my tests it worked so.

> I guess that, without its config files, PAM would not allow anything,
> right?

Correct.

>
> If so, then the default files should come _before_ they are required.
>

Yes, this is reasonable.

>
> Thanks for bearing with me. ;-)
>

That's fine: thanks for your comments.

I'll see if there are any more comments on these patches and will try
to reorder and resubmit them later tonight.

-- 
Dmitry Golubovsky

Anywhere on the Web
