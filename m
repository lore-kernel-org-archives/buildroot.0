From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 27 Jun 2011 09:10:02 +0200
Subject: [Buildroot] [PATCH] linux: Change patch matching string to
 allow all names. This allows the use of patches output by git format-patch.
In-Reply-To: <1308924529-32225-1-git-send-email-mike@mikebwilliams.com>
References: <1308924529-32225-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <BANLkTikb9RCrHgJMYtaw1_d9K1j6bk=unw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/24 Mike Williams <mike@mikebwilliams.com>:
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -98,7 +98,7 @@ $(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
> ? ? ? ? ? ? ? ?if echo $$p | grep -q -E "^ftp://|^http://" ; then \
> ? ? ? ? ? ? ? ? ? ? ? ?toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
> ? ? ? ? ? ? ? ?elif test -d $$p ; then \
> - ? ? ? ? ? ? ? ? ? ? ? toolchain/patch-kernel.sh $(@D) $$p linux-\*.patch ; \
> + ? ? ? ? ? ? ? ? ? ? ? toolchain/patch-kernel.sh $(@D) $$p \*.patch ; \

I have to disagree on this. There might be patches for other packages
in that same dir.

And by the way;
http://spheredev.org/wiki/Git_for_the_lazy#Writing_good_commit_messages
