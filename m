From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Apr 2017 23:14:29 +0200
Subject: [Buildroot] [PATCH] qemu: allow to build statically
In-Reply-To: <20170402143717.40a43f24@free-electrons.com>
References: <20161109100305.6261-1-jezz@sysmic.org>
 <20170402143717.40a43f24@free-electrons.com>
Message-ID: <20170402211429.GB21845@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2017-04-02 14:37 +0200, Thomas Petazzoni spake thusly:
> On Wed,  9 Nov 2016 11:03:05 +0100, J?r?me Pouiller wrote:
> > Compiling Qemu statically allows to use it to chroot into target/. It is a
> > nice feature, so add an option for it.
> > 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> >  package/qemu/Config.in.host | 26 ++++++++++++++++++++++++++
> >  package/qemu/qemu.mk        |  4 ++++
> >  2 files changed, 30 insertions(+)
> 
> Now that this patch is committed, we are seeing some build failures on
> host-qemu when linked statically:
> 
>   http://autobuild.buildroot.net/results/6bc/6bcfabc020fede51adcfafc9a570df5884d95696/build-end.log
>   http://autobuild.buildroot.net/results/4d0/4d0182da77cf386e57acf0565a18fc4628abbdc8/build-end.log
> 
> Could you have a look?

Feel free to grab patches from my okd series (which I lost intetrest in
sometime ago):

    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/target-qemu

At the time, I had full and complete static-link support with a lot of
additional dependencies...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
