From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 25 Oct 2011 01:53:27 -0400
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <CAGiDA6LvDVGeOzyKk+D4W=Tctis+AJ5hTi8eRpHsDmtqZW-DNg@mail.gmail.com>
References: <20111024173815.2277c6dd@skate>
 <CAGiDA6LvDVGeOzyKk+D4W=Tctis+AJ5hTi8eRpHsDmtqZW-DNg@mail.gmail.com>
Message-ID: <CAJaTeTqdeXkHYz9guP+pgAcovSEsMrWdizjfxzpxj_9d+Urh+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 24, 2011 at 17:44, Shawn J. Goff wrote:
>> ?? - Keep installing package files in their normal directory, but
>> ? ? ?detect new files and modified files.
>>
>> ? ? ?Pros:
>>
>> ? ? ? ?no need to change anything in the current package installation
>> ? ? ? ?procedures.
>>
>> ? ? ?Cons:
>>
>> ? ? ? ?need to scan the TARGET_DIR, STAGING_DIR and HOST_DIR after
>> ? ? ? ?every package installation.
>>
>> ? ? ? ?hard to detect modified/overwritten files, except by storing
>> ? ? ? ?hashes of installed files.
>>
>
> Would inotify not be suitable for this? You could use it to generate a
> list of which files were created/deleted/modified.

not really.  you'd have to write an inotify daemon, and then keep it
running the entire time from when you last installed to the new
install.  basically it doesn't work out.
-mike
