From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Nov 2017 20:37:23 +0100
Subject: [Buildroot] [PATCH 1/1] python-cython: new package
In-Reply-To: <CAMWSM7hvCB=xm+ShA8orvbbbN+d1o=nwBDvjvF_aGMyXByWGsQ@mail.gmail.com>
References: <20171106203539.26391-1-joseph.kogut@gmail.com>
 <20171125134511.25ea518f@windsurf.lan>
 <CAMWSM7hvCB=xm+ShA8orvbbbN+d1o=nwBDvjvF_aGMyXByWGsQ@mail.gmail.com>
Message-ID: <348a2b0f-57a3-8e5b-ee20-64e8aefa1e1d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joseph,

On 25-11-17 19:34, Joseph Kogut wrote:
> Hi Thomas,
> 
> On Sat, Nov 25, 2017 at 4:45 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Mon,  6 Nov 2017 12:35:39 -0800, Joseph Kogut wrote:
>>
>>
>>> diff --git a/package/python-cython/Config.in.host b/package/python-cython/Config.in.host
>>> new file mode 100644
>>> index 0000000000..69d32d5ab3
>>> --- /dev/null
>>> +++ b/package/python-cython/Config.in.host
>>> @@ -0,0 +1,7 @@
>>> +config BR2_PACKAGE_HOST_PYTHON_CYTHON
>>> +     bool "host python-cython"
>>> +     help
>>> +       The Cython compiler for writing C extensions for the Python
>>> +       language.
>>> +
>>> +       http://cython.org/
>>
>> Could you briefly explain the use-case for Cython, in the context of
>> Buildroot? How are you using it? To achieve what?
> 
> Cython is a dependency of certain Python packages, where it's used in
> setup.py to convert Python modules with modified syntax to C, at
> which point they're compiled into C extensions. Specifically, I'm
> looking to introduce a package for Kivy (https://kivy.org), which
> makes use of Cython heavily.
> 
>> I'm just trying to understand whether it makes sense to have a visible
>> option in menuconfig for this package (or not).
> 
> That's a great question, and the answer at this point is that it
> probably doesn't. Cython requires a compiler to work, and only the
> binaries it generates belong in the target. It might make more sense
> for packages that require it to specify it as a dependency in their
> makefile.
> 
> Would you like me to make that change?

 Yes please. But then it doesn't make sense to submit the package until there is
another package that actually uses it. So please submit it in a series when you
submit kivy.

 When you do, could you make one more small change: in the hash file, you have
'locally computed' and later 'locally calculated'. Use just one of the two
expressions. 'computed' seems to be more popular.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
