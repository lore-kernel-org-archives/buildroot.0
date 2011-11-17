From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 Nov 2011 21:19:31 +0100
Subject: [Buildroot] [PATCH 1 of 5 v2] Makefile.package.in: add utility
 functions find*clauses and notfirstword
In-Reply-To: <20111117205010.60a99ee3@skate>
References: <patchbomb.1321557989@devws108>
 <b6579582d02dd802adca.1321557990@devws108>
 <20111117205010.60a99ee3@skate>
Message-ID: <CAAXf6LXjFSFHt9xRja_eqP53wQwgx1K0RRyYtU=GK=Kkx+Q6Lg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 17, 2011 at 8:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 17 Nov 2011 20:41:48 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Functions finddirclauses and findfileclauses help in building a find
>> command that skips a set of directories and performs operations on a
>> set of files. This pattern can for example be used to keep certain
>> files or directories from being stripped, or to remove certain files
>> from a package installation.
>
> I must say I am not a big fan of this. Those macros are horribly
> complicated to understand and they make the code really cryptic. I
> think I would really prefer to see the implementation of these "do not
> strip this file/directory" option to be done without those cryptic
> macros.

Do you mean to add the contents of the macro directly in the
target-finalize target? I fear this will not make target-finalize much
clearer.

My reasoning of putting this in a macro, is that the complexity is
just in one place. If a user can trust that the macro is right, he
doesn't have to care about it.

Also, I don't immediately see a simpler way of adding such -name
clauses to the find command, based on user input.

Thanks for your feedback,
Thomas
