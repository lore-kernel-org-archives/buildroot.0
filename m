From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Dec 2009 09:18:36 +0100
Subject: [Buildroot] update on a file in tslib not reflected after doing
	"Make"
In-Reply-To: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
	(Stanley's message of "Tue, 15 Dec 2009 15:30:06 +0800")
References: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
Message-ID: <874onsr6oz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stanley" == Stanley  <eva2002@gmail.com> writes:

 Stanley> Hi all,

 Stanley> I am new to embedded world and this is the first time using
 Stanley> buildroot.  I am currently trying to solve a problem in one of
 Stanley> the files (input-raw.c) on tslib. However after modify/patch
 Stanley> the file, I do a "make" in main buildroot directory. However
 Stanley> the changes did not reflected (tested by adding a few texts in
 Stanley> already existing printf statement).

 Stanley> Here is what I did.

 Stanley> 1) delete "tslib" folder from "build_arm" folder.

If you have a build_arm folder, then you are not using the latest
release. Any reason why you are not using 2009.11?

So if I get you right, you want to add a custom patch to tslib? You can
either just place it in package/tslib together with the other patches
(make sure you name it tslib-1.0-<something>.patch), or for a quick test
just build tslib without changing anything, and then afterwards go to
output/build/tslib-1.0, change what you need to change and then remove
the stamp file (.stamp_built).

Once that is done you can just rerun make from the toplevel buildroot
dir and tslib should get rebuilt/reinstalled.

-- 
Bye, Peter Korsgaard
