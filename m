From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Apr 2016 11:13:45 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <570B6A67.1000806@mind.be>
References: <20160408224541.79e1ba4d@itchy> <570A77F9.50506@mind.be>
 <20160411103211.3d9a1581@free-electrons.com> <570B6A67.1000806@mind.be>
Message-ID: <570B6AC9.2000700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/11/16 11:12, Arnout Vandecappelle wrote:
>
>
> On 04/11/16 10:32, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sun, 10 Apr 2016 17:57:45 +0200, Arnout Vandecappelle wrote:
>>
>>>    We try to avoid requiring python for a normal build, and use it only for
>>> specific scripts at the moment (like graph-depends).
>>
>> Right, but on the other hand, support/dependencies/dependencies.sh
>> verifies unconditionally that there is a python interpreter available
>> on the build machine. So there is not really anything that prevents
>> from using python stuff during the build. Unless of course this Python
>> logic starts to use modules not in the Python standard library, of
>> course.
>
>   Well, for the fix-rpath stuff we asked Samuel to do in in shell instead of
> python, with the argument that we want to avoid python to be in the critical
> path of a normal build. That said, this would only be for a rust build, not for
> all builds, so it's less critical.
>
>   BTW note that e.g. for waf-based packages, we always use host-python, not
> system python. But that's probably because waf is not python3 compatible.
>
>   So, if python is used, please make sure it runs on any python (with full
> standard library) from python2.4 (RHEL5) to python3.5. That means that using the
> json standard library module is not an option, since it was introduced only in
> python 2.6.

  Unless of course you add a dependency on host-python or host-python3 (make 
sure you select the version that corresponds to the selected target python, to 
avoid unnecessarily building both). Since we can probably consider rust to be a 
big package, adding an addition host-python dependency is acceptable IMHO.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
