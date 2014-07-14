From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Jul 2014 09:51:44 -0300
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <20140714124701.GC3684@free.fr>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com> <20140714123048.GB3684@free.fr>
 <53C3CFB1.8070101@zacarias.com.ar> <20140714124701.GC3684@free.fr>
Message-ID: <53C3D260.3000802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2014 09:47 AM, Yann E. MORIN wrote:

>> Also we might be able to filter gettextizing out when
>> gettext/host-gettext aren't pulled in - no infra version mismatch to
>> account for, hence time savings.
> 
> But we can only know that when the package is extracted+patched, which
> is too late for the dependency rules, no?

It's likely the host-gettext infra that triggers the problem (may as
well be target gettext, i haven't tested as much), so we might be able
to skip the run if gettext isn't in DEPENDENCIES (and not pulling it in
if GETTEXTIZE = YES, just running if it is for packages that gettextize).
Regards.
