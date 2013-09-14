From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Sep 2013 00:30:44 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130914223044.GB3444@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-09-14 21:03 +0200, Thomas Petazzoni spake thusly:
> Here is the second version of the BR2_EXTERNAL patch series.
> 
> Changes since v1
[--SNIP--]
>  * BR2_EXTERNAL is turned into an absolute path, in order to avoid any
>    problem. Suggested by Arnout.

I dsiagree on that one: just use whatever the user passed in
BR2_EXTERNAL.

I see at least one case where it will help. Let's suppose I decide to
distribute my Buildroot tree *and* my external tree. I decide to do so
as thus:
    $ tar tf project.tar
    project/
    project/buildroot/
    project/buildroot/all-buildroot-files-and-dirs
    project/buildroot/.config
    project/external/
    project/external/all-external-files-and-dirs

and project/buildroot/.config would contain BR2_EXTERNAL="../external"
so the recipient would just have to run make withour hurdles.

If .config would contain absolute paths, .config would be broken as
soon as it gets distribute (chances the recipient uses the same
directory layout as my build machine is near zero).

I think we should instead try to fix the cases were relative paths are
broken, and use exactly what the user passes us, as-is, without mangling.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
