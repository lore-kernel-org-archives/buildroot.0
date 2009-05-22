From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 May 2009 20:20:36 +0000 (UTC)
Subject: [Buildroot] [Bug 345] libcurl package needs a urandom fix
In-Reply-To: <bug-345-163@https.bugs.busybox.net/>
References: <bug-345-163@https.bugs.busybox.net/>
Message-ID: <20090522202036.4F83B77856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=345





--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-05-22 20:20:35 UTC ---
Sure, but you're not EAUTORECONFing :)
So configure says:

                    { echo "$as_me:$LINENO: checking for \"/dev/urandom\"" >&5
echo $ECHO_N "checking for \"/dev/urandom\"... $ECHO_C" >&6; }
if test "${ac_cv_file___dev_urandom_+set}" = set; then
  echo $ECHO_N "(cached) $ECHO_C" >&6
else
  test "$cross_compiling" = yes &&
  { { echo "$as_me:$LINENO: error: cannot check for file existence when cross
compiling" >&5
echo "$as_me: error: cannot check for file existence when cross compiling"
>&2;}
   { (exit 1); exit 1; }; }
if test -r ""/dev/urandom""; then
  ac_cv_file___dev_urandom_=yes
else
  ac_cv_file___dev_urandom_=no
fi

Which wants it when cross-compiling no matter what...


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
