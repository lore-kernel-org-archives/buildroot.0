From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 8 Jan 2015 16:21:47 -0600
Subject: [Buildroot] [PATCH v2 02/28] sepolgen: new package
In-Reply-To: <20150108230639.1f195b21@free-electrons.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420650663-49350-3-git-send-email-matthew.weber@rockwellcollins.com>
 <20150108230639.1f195b21@free-electrons.com>
Message-ID: <CANQCQpZ_xJen1ir+tC4z4fSkmb9KNZY8jPPK80ENpoXwFqFJ7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Thu, Jan 8, 2015 at 4:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Wed,  7 Jan 2015 11:10:37 -0600, Matt Weber wrote:
>
>> diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
>> new file mode 100644
>> index 0000000..f1e8898
>> --- /dev/null
>> +++ b/package/sepolgen/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_SEPOLGEN
>> +     bool "sepolgen"
>> +     help
>> +       sepolgen is a python module/library that forms the core
>> +       of the modern audit2allow (a rewrite).
>> +
>> +       http://selinuxproject.org/page/Main_Page
>
> So we have a Config.in entry to enable a target package...
<snip>

>> +
>> +$(eval $(host-generic-package))
>
> But this only creates a host package.
>
> I'm confused :-)

Sorry that should have been a Config.in.host.  When cleaning up the
debugging of selinux policy to be only on the host we didn't move the
Config.in to be solely a host config.  Noted and I'll update.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
