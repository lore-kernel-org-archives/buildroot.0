From: Shawn J. Goff <shawn7400@gmail.com>
Date: Mon, 24 Oct 2011 17:44:00 -0400
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111024173815.2277c6dd@skate>
References: <20111024173815.2277c6dd@skate>
Message-ID: <CAGiDA6LvDVGeOzyKk+D4W=Tctis+AJ5hTi8eRpHsDmtqZW-DNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ?? - Keep installing package files in their normal directory, but
> ? ? ?detect new files and modified files.
>
> ? ? ?Pros:
>
> ? ? ? ?no need to change anything in the current package installation
> ? ? ? ?procedures.
>
> ? ? ?Cons:
>
> ? ? ? ?need to scan the TARGET_DIR, STAGING_DIR and HOST_DIR after
> ? ? ? ?every package installation.
>
> ? ? ? ?hard to detect modified/overwritten files, except by storing
> ? ? ? ?hashes of installed files.
>

Would inotify not be suitable for this? You could use it to generate a
list of which files were created/deleted/modified.
