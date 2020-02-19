From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 22:34:07 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 19 Feb 2020 21:33:45
 +0100")
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
 <20200219194858.11b317f6@windsurf>
 <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
Message-ID: <87mu9ecldc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 > In the memory usage, RES first increased to ~4G, and then dropped back
 > to 2.2G. I think this is the Python garbage collector kicking in,
 > _after_ the new file is loaded.
 > So the worst case memory usage is roughly the size of two largest
 > subsequent years.

 > Doing some quick google search, I stumbled upon the 'pandas' python
 > package, which has a read_json function too. During a quick test, it
 > seemed to be more memory efficient, and the total memory size on
 > subsequent reads stayed in the 2.x GB range.

 > content = pandas.read_json('/tmp/nvd/nvdcve-1.0-2019.json.gz')
 > content = pandas.read_json('/tmp/nvd/nvdcve-1.0-2018.json.gz')

 > In the full test of pkg-stats, I still saw a peak memory usage near
 > the end, but it 'seemed' better :-)

Or perhaps something that doesn't load the entire json structure into
memory? Jsonslicer seems like a possible solution:

https://pypi.org/project/jsonslicer/

-- 
Bye, Peter Korsgaard
