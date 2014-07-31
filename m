From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jul 2014 19:19:34 +0200
Subject: [Buildroot] [PATCH v3 2/3] apply-patches.sh: Use [[...]]
	construct instead of [...] construct
In-Reply-To: <1406826517-6106-3-git-send-email-fabio.porcedda@gmail.com>
References: <1406826517-6106-1-git-send-email-fabio.porcedda@gmail.com>
 <1406826517-6106-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <00392aed-ce27-4eea-985b-75f06f79e0d7@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio Porcedda <fabio.porcedda@gmail.com> schreef:
>The [[...]] construct it's an improved and safer construct than the
>[...] construct. It's safer because it doesn't do "word splitting" so
>we don't need to enclose variable expansion with double quotes, e.g:
>
>   [ -e "$file" ] -> [[ -e $file ]]
>---


I'm not so convinced by this patch. [[]] is a bashism, it is not
 supported in all shells. 
Yes, using single brackets means that you need to take care, 
but anyway shell programming has many pitfalls.

In the past people have sent patches to make Buildroot 
more compatible with non-bash shells, so moving in the opposite
 direction is not a good idea IMO.

Best regards,
Thomas
