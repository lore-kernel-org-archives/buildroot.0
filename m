From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 11:56:59 +0200
Subject: [Buildroot] [PATCH] Add package fribidi
In-Reply-To: <CA+pfegEo9-Q9y8TQxwnbhASem=a1uU5=YnuvY=MbZ3rO1-ycPw@mail.gmail.com>
 (Murat Demirten's message of "Tue, 5 Jul 2011 12:42:05 +0300")
References: <BANLkTinpAtwa0MsVbvyR7cTrbewGt5Jc6A@mail.gmail.com>
 <87zkktw13z.fsf@macbook.be.48ers.dk>
 <CA+pfegEo9-Q9y8TQxwnbhASem=a1uU5=YnuvY=MbZ3rO1-ycPw@mail.gmail.com>
Message-ID: <87aactvyms.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:

 Murat> Hi Peter,

 Murat> There is no information about toolchain or localization
 Murat> requirements. But I just look at the source code and it seems
 Murat> that? this library can be compiled in all the cases, there is no
 Murat> special requirements.

OK, good - I didn't actually check, just expected so because of the
unicode handling.

 Murat> We need a custom install step because we don't want to see other
 Murat> than the library itself on the target.

 Murat> But in some cases, maybe fribidi and fribidi-config binary
 Murat> required by someone else on target. So, keeping these binaries
 Murat> in target usr/bin and giving the possibility to remove with
 Murat> standard postbuild script mechanism will be fine (Is there any
 Murat> hints to not install header files on the target?).

 Murat> What do you think about? Is there any policy for the packages
 Murat> which provides useful libraries and some binaries rarely need on
 Murat> target? Do we have to put all the binaries in target too?
 Murat> Sometimes these types of binaries not prepared for running on
 Murat> the target (like navit->maptool). Putting this binaries only to
 Murat> staging area keeps the target clean but I see that, there must
 Murat> be a policy, we can't put custom binary install logic for every
 Murat> single package.

Buildroot already cleans up header files and so on if not wanted on a
global level (see target-finalize).

For optional binaries and similar, it is typically handled by a sub
option in the package you can enable if you want them.

-- 
Bye, Peter Korsgaard
