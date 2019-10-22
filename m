From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Oct 2019 23:58:41 +0200
Subject: [Buildroot] [PATCH v14 4/5] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <20191022225920.7e35e42e@windsurf>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-5-aduskett@gmail.com>
 <20191022225920.7e35e42e@windsurf>
Message-ID: <b3699991-75ec-157a-0a4f-913a7a1d83f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Note that this patch was authored by me, Adam accidentally took over authorship
(which is why he said on IRC he needs to send a v15).

On 22/10/2019 22:59, Thomas Petazzoni wrote:
> On Mon, 21 Oct 2019 13:04:37 -0700
> aduskett at gmail.com wrote:
> 
>> +	_PYTHON_SYSCONFIGDATA_NAME="$$(if $$(BR2_PACKAGE_PYTHON3),$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)" \
> 
> Why do we need this conditional on BR2_PACKAGE_PYTHON3 ?
> package/pkg-python.mk is using PKG_PYTHON_SYSCONFIGDATA_NAME
> unconditionally, regardless of Python 2.x vs. Python 3.x. Could you
> explain this ?

 I can :-)

 It's a mistake. I noticed that PKG_PYTHON_SYSCONFIGDATA_NAME was left empty for
python2, so I made sure it got the correct value (in Python2 there is only one
_sysconfigdata). However, python2 doesn't have the _PYTHON_SYSCONFIGDATA_NAME
variable so it's meaningless.

 Should be tested if things work OK with python2 on target, but I expect they do.

 Regards,
 Arnout
