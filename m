From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 20 Oct 2018 18:49:09 +0300
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
In-Reply-To: <CAGm1_kt3i+0Bygvnz-kwvJgtX9Hvk78mwuVsOqwW6j0Vzukcag@mail.gmail.com>
References: <20180917155554.05aa9b43@windsurf>
 <5ba0637b42763_47f82b17fc7e25f429690@ultri5.mail>
 <CAGm1_kt3i+0Bygvnz-kwvJgtX9Hvk78mwuVsOqwW6j0Vzukcag@mail.gmail.com>
Message-ID: <CALFsTFVpjgYWNr=VoeT3Wj+DjYtFdUNNNw9_Z2COzQMrpxQxWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just remembered I've submitted a patch for a new host package long
time ago: http://patchwork.ozlabs.org/patch/896368/
Yegor mentioned that maybe it can help to reduce python-crossbar
startup time on the tests.
Thomas/Yegor, I see the patch was reviewed by Yegor but wasn't
applied. If there's something missing, please let me know.
I hope it will help.

Regards,
Asaf.
On Tue, Sep 18, 2018 at 9:20 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Sep 18, 2018 at 4:31 AM Ricardo Martincoski
> <ricardo.martincoski@gmail.com> wrote:
> >
> > Hello,
> >
> > On Mon, Sep 17, 2018 at 10:55 AM, Thomas Petazzoni wrote:
> >
> > > On Thu, 15 Feb 2018 23:16:32 -0200, Ricardo Martincoski wrote:
> > >
> > >> On Thu, Feb 15, 2018 at 11:41 AM, Yegor Yefremov wrote:
> > >>
> > >> [snip]
> > >> >
> > >> > I've tried this test locally, but it always timeouts. Even if I
> > >> > specify an hour as a timeout.
> > >>
> > >> I confirm that here, both test cases fail by timeout, so it should not be
> > >> related to the host.
> >
> > At the time I confirmed with the patch applied on aa77030b8f and also on
> > (aa77030b8f +
> >  http://patchwork.ozlabs.org/patch/874421/ +
> >  http://patchwork.ozlabs.org/patch/874422/ )
> > and I got the timeout in both cases.
> >
> > >
> > > I applied Yegor's patch, and ran he test. It doesn't time out here.
> > > Here is what I have in the TestPythonPy2Crossbar-run.log:
> > >
> > > Welcome to Buildroot
> > > buildroot login: root
> > > # dmesg -n 1
> > > # echo $?
> > > 0
> > > # python -m crossbar version
> > > Traceback (most recent call last):
> > >   File "usr/lib/python2.7/runpy.py", line 174, in _run_module_as_main
> > >   File "usr/lib/python2.7/runpy.py", line 72, in _run_code
> > >   File "usr/lib/python2.7/site-packages/crossbar/__main__.py", line 36, in <module>
> > >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 479, in load_entry_point
> > >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 2703, in load_entry_point
> > >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 2320, in load
> > >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 2343, in require
> > >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 782, in resolve
> > > pkg_resources.ContextualVersionConflict: (txaio 2.8.2 (/usr/lib/python2.7/site-packages), Requirement.parse('txaio>=18.8.1'), set(['autobahn']))
> > > # echo $?
> > > 1
> > >
> > > So it doesn't work due to some dependency issues. Is the timeout
> > > problem going to appear once those dependency issues are solved ? Or
> > > should I have already seen the timeout ?
> >
> > Sorry, I don't know.
> >
> > Yegor, any idea? Could you bisect this? I already started:
> > 2018.02-rc2-4-gaa77030b8f + patch = timeout
> > 2018.08-425-gc5a33a11be + patch = dependency issue
> > 2018.05-rc3-25-gd937f908f1 + patch = timeout
> > 2018.05-756-g3d34f36806 + patch = (still running:
> > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/98611581 )
>
> Thanks for working on this issue. AFAIK crossbar abandoned Py2 support
> in the newest version, so there is less to take of, but there are
> still issues with Py3.7 and async keywords, that need to be resolved
> first.
>
> I don't know when I'll have time to update crossbar, so if you can
> take over it would be great.
>
> Thanks.
>
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
