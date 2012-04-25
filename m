From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 25 Apr 2012 13:02:52 +0000 (UTC)
Subject: [Buildroot] How do you add a package subdirectory?
References: <jn795b$kbq$1@dough.gmane.org>
 <CAAXf6LU8+LZGYn-BQTkyjzDEQgLDkGeHrsd5WBt7NftnVfCjPg@mail.gmail.com>
Message-ID: <jn8slr$fpi$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-25, Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Grant,
>
> On Wed, Apr 25, 2012 at 12:23 AM, Grant Edwards
><grant.b.edwards@gmail.com> wrote:
>> I'm trying to add local packages to 2012.02, and I'd like them to live
>> in a subdirectory underneath "package" (e.g. package/mycompany).
[...]
>> The "mycompany" submenu shows up where it's supposed to,
[...]
>> But, when I actually do the "make", buildroot won't attempt to build
>> packages "foo" and "bar" unless I create symlinks in the packages
>> directory that point to the corresponding directories in the mycompany
>> subdirectory
[...]

> Have a look at http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf,
> pages 27-28 where this scenario is described.

Cool.  There should be a link to this on the "Documentation" page.

> What I think you are missing is the top-level .mk file in
> /package/company/company.mk which includes all sub-mk files.

That's it.  I swear I looked for files like that and they weren't
there yesterday...

Thanks!

-- 
Grant Edwards               grant.b.edwards        Yow! If elected, Zippy
                                  at               pledges to each and every
                              gmail.com            American a 55-year-old
                                                   houseboy ...
