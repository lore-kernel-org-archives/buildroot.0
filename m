From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 09:23:46 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <1loa9exfa8.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Wed, 20 Sep 2017 20:29:21 +0200")
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
 <87fubhxnnx.fsf@dell.be.48ers.dk>
 <CANQCQpa9S7chHUTg1GBNz9Qi=r-tMeQnQO2sYpNdZ7oQ+9MP9w@mail.gmail.com>
 <1loa9exfa8.ln2@ID-313208.user.individual.net>
Message-ID: <87377gy0ot.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 > I do not see a perfect solution for this problem, the fallback to s.b.o. 
 > will not circumvent download failures because it does not provide source 
 > tarballs for all packages:

 > $ LC_ALL=C wget sources.buildroot.org/kodi-17.4-Krypton.tar.gz
 > --2017-09-20 20:23:27--  http://sources.buildroot.org/kodi-17.4-
 > Krypton.tar.gz
 > Resolving sources.buildroot.org (sources.buildroot.org)... 176.9.16.109
 > Connecting to sources.buildroot.org (sources.buildroot.org)|
 > 176.9.16.109|:80... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2017-09-20 20:23:27 ERROR 404: Not Found.

 > Not committing this patch means that downloading the kodi package will 
 > always fail. Otoh I recognize the mess for the lts versions...

Odd that hasn't been downloaded yet, but kodi was only very recently
bumped (post-2017.08), so there's no problem fixing the hash there.

Can you send a patch only fixing the kodi hash?


 > Additionally not all users are using
 > BR2_BACKUP_SITE="http://sources.buildroot.net"
 > in their setup, I normally deactivate this option to save bandwidth and 
 > to be informed when upstream did changes to its website.

Save bandwidth? I can understand disabling the option for development
reasons, but this is exactly the reason why we are running the mirror in
the first place and I wouldn't recommend disabling the option for
"normal" users.

-- 
Bye, Peter Korsgaard
