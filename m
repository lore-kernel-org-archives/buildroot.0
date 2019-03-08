From: Juan A. Rubio <jarubio2001@gmail.com>
Date: Fri, 8 Mar 2019 23:42:26 +0000
Subject: [Buildroot] QT 5.6 app with eglfs and etnaviv (imx6 solo,
 buildroot 2018.02.5)
In-Reply-To: <CAOMZO5DYCL3ENfoc8tYdNs3XFAurTaoe5Y8ho2CDB2+iYX2zQA@mail.gmail.com>
References: <CAE58QoMfF2Kwi0Hc_yOeOinoLA-82OfzzeymOBXsjMK=nYoK5g@mail.gmail.com>
 <20190308235223.62e76a71@gmx.net>
 <CAOMZO5DYCL3ENfoc8tYdNs3XFAurTaoe5Y8ho2CDB2+iYX2zQA@mail.gmail.com>
Message-ID: <CAE58QoNKbu=B6KR_X=rbzbi5Mf+POGsT9k8CZgX70DWQn+Jmmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Fabio,

Thanks, I did realize that I was missing the QT_QPA_EGLFS_KMS_CONFIG.
After passing the json file, the application started to work, although
I believe with software rendering (QSGRenderThread is using 100% of
CPU). It looks like the etnaviv driver is not being loaded but I think
that is something I need to check in my kernel.

BR,
Juan

On Fri, Mar 8, 2019 at 11:04 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Juan,
>
> On Fri, Mar 8, 2019 at 7:52 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> > > I'm obviously missing something here. Any help would be very much appreciated.
> >
> > Mind to share your complete .config/defconfig?
> >
> > Did your run an complete re-build (make clean; make), see [1]?
>
> Besides Peter's suggestion, you may try to look at
> configs/imx6-sabresd_qt5_defconfig, which generates a QT demo using
> Etnaviv.
>
> I wrote some notes about it at:
> https://imxdev.gitlab.io/tutorial/Running_QT5.9_with_mainline_kernel_on_mx6sabresd_board/
>
> Hope this helps.
>
> Regards,
>
> Fabio Estevam
