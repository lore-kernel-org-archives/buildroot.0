From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Tue, 3 May 2016 17:08:31 -0400 (EDT)
Subject: [Buildroot] [PATCH v1 1/4] libpjsip: add gnutls support and fix
 various things
In-Reply-To: <20160422232155.6ac9c7e2@free-electrons.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160422232155.6ac9c7e2@free-electrons.com>
Message-ID: <1719666448.88685.1462309711357.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Apr 22, 2016, at 5:21 PM, Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote:
> On Fri, 22 Apr 2016 16:57:05 -0400, Patrick Keroulas wrote:
>> Endianness for ARM.
>> Add missing errno.
>> Add multiple listeners.
>> Fix ICE config and session.
> 
> As the commit title suggests, this patch does too many things in one
> patch. Each of the things that you list here should be done by a
> separate patch.

Understood.

> 
>>  package/libpjsip/0003-Add-gnutls-support.patch     | 3373 ++++++++++++++++++++
> 
> Please don't include the generated configure script changes. Just patch
> configure.ac, and mark the package with <pkg>_AUTORECONF = YES.

For some reason, configure.ac was replaced with aconfigure.ac and it seems that 
autoconf is excluded from the build process. Then, configure script actually points
at pre-generated aconfigure.

Q: Should I add a link to aconfigure.ac to avoid autoconf error?
Or should I adjust <pkg>_AUTORECONF_(OPTS|ENV)

> 
> However, Buildroot has the policy of not carrying feature patches,
> which this one clearly is. Some please get this patch integrated
> upstream first, and then we can benefit from this feature in Buildroot.
> 
> Having large feature patches like this one in Buildroot would prevent
> us from easily updating libpjsip in the future, which is not a
> situation we like.

We've been trying to push these patches up-stream for 2 years now, without response from pjproject.
http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2014-May/017492.html
http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2015-January/018072.html

Thanks,

Patrick
