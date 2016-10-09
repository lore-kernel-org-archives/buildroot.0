From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 9 Oct 2016 11:44:28 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
	python
In-Reply-To: <so9pcdxaht.ln2@ID-313208.user.individual.net>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
 <20161008122434.GA3802@free.fr> <20161008145107.277673a8@free-electrons.com>
 <20161008135130.GB3802@free.fr> <20161008160228.71f9e08f@free-electrons.com>
 <jkhncdxdku.ln2@ID-313208.user.individual.net>
 <CAGm1_kv=SFf1jZ=O+JAOiqL9e+_WtQ=UpxeTbX2AQayntH8BaQ@mail.gmail.com>
 <so9pcdxaht.ln2@ID-313208.user.individual.net>
Message-ID: <CAGm1_kui+NUcQZq8VuAf9RDjXA+-=tx_moY0i2zOcQpi9HMTyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 9, 2016 at 9:55 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Am Sat, 08 Oct 2016 20:23:09 +0200 schrieb Yegor Yefremov:
>
>> isn't mwclient Python 3 compatible? See [1]
>>
>> [1] https://github.com/mwclient/mwclient/blob/master/setup.py#L48
>
> Hi Yegor,
>
> using this defconfig
>
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_MWCLIENT=y
>
> this error occurs with plain make:
> -------------------------------------------------
>>>>   Finalizing target directory
> PYTHONPATH="/home/buildroot/br3_couchdb/output/target/usr/lib/python3.5/
> sysconfigdata/:/home/buildroot/br3_couchdb/output/target/usr/lib/
> python3.5/site-packages/" /home/buildroot/br3_couchdb/output/host/usr/bin/
> python3.5 support/scripts/pycompile.py /home/buildroot/br3_couchdb/output/
> target/usr/lib/python3.5
> Traceback (most recent call last):
>   File "/home/buildroot/br3_couchdb/output/host/usr/lib/python3.5/
> py_compile.py", line 125, in compile
>     _optimize=optimize)
>   File "<frozen importlib._bootstrap_external>", line 700, in
> source_to_code
>   File "<frozen importlib._bootstrap>", line 222, in
> _call_with_frames_removed
>   File "/home/buildroot/br3_couchdb/output/target/usr/lib/python3.5/site-
> packages/mwclient/ex.py", line 15
>     exec _file in globals(), predata
>              ^
> SyntaxError: invalid syntax
> -------------------------------------------------
> This error does not occur with python2.

OK. I'll try to take a look at this issue.

Yegor
