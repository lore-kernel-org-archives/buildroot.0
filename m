From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 20 Feb 2020 07:31:37 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <87mu9ecldc.fsf@dell.be.48ers.dk>
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
 <20200219194858.11b317f6@windsurf>
 <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
 <87mu9ecldc.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWgtJ2LvtFArhbGk7Bg4__eqX1bC7At=VNYn=ROFP=GvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 19, 2020, 22:34 Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas De Schampheleire <
> patrickdepinguin+buildroot at gmail.com> writes:
>
> Hi,
>
>  > In the memory usage, RES first increased to ~4G, and then dropped back
>  > to 2.2G. I think this is the Python garbage collector kicking in,
>  > _after_ the new file is loaded.
>  > So the worst case memory usage is roughly the size of two largest
>  > subsequent years.
>
>  > Doing some quick google search, I stumbled upon the 'pandas' python
>  > package, which has a read_json function too. During a quick test, it
>  > seemed to be more memory efficient, and the total memory size on
>  > subsequent reads stayed in the 2.x GB range.
>
>  > content = pandas.read_json('/tmp/nvd/nvdcve-1.0-2019.json.gz')
>  > content = pandas.read_json('/tmp/nvd/nvdcve-1.0-2018.json.gz')
>
>  > In the full test of pkg-stats, I still saw a peak memory usage near
>  > the end, but it 'seemed' better :-)
>
> Or perhaps something that doesn't load the entire json structure into
> memory? Jsonslicer seems like a possible solution:
>
> https://pypi.org/project/jsonslicer/


Interesting, I hadn't seen it.
Note that we'll need to make the code py3-ready because jsonslicer is
python 3.4+ only.

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200220/367f11ca/attachment.html>
