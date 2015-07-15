From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jul 2015 16:17:08 +0200
Subject: [Buildroot] Package naming convention [was: Re: [PATCH 1/2]
 scanpypi: new utility]
In-Reply-To: <916572081.3104684.1436969298786.JavaMail.root@openwide.fr>
References: <916572081.3104684.1436969298786.JavaMail.root@openwide.fr>
Message-ID: <55A66B64.5090603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 A topic for all to discuss here...

On 07/15/15 16:08, Denis Thulin wrote:
[snip]
>>> +def pkg_buildroot_name(pkg_name):
>>> +    """
>>> +    Returns name to avoid troublesome characters.
>>
>>  No it doesn't.
>>
>> Returns the buildroot package name for the PyPI package pkg_name.
>>
>>
>>  In fact, the function should also prepend the python- prefix,
>>  because the
>> buildroot name starts with python-.
> 
> Actually, I have a question here, should I change . into - or into nothing ?
> I'm asking this because when looking into existing packages I noticed 'web.py'
> became 'python-webpy' but 'zope.interface' became 'python-zope-interface'

 Good question, we indeed have no real convention of what the buildroot name is
for packages with weird characters.

 Actually, we do: keep the upstream name as much as possible. So python-webpy,
for instance, keeps the upstream webpy name (note that the upstream name is
webpy, even though the package is identified in PyPI as web.py. PyPI isn't very
consistent either). For zope.interface, I actually see no reason not to keep the
upstream name, so the package really should have been called
python-zope.interface IMHO.

 What do the others think?

 BTW Thanks Denis for pointing this out.

 Regards,
 Arnout

> 
>>
>>> +    Remove all non alphanumeric characters except -
>>> +    Also lowers the name
>>> +
>>> +    Keyword arguments:
>>> +    pkg_name -- String to rename
>>> +    """
>>> +    name = re.sub('[^\w-]', '', pkg_name.lower())
>>> +    name = re.sub('^python-', '', name)
>>> +    return name
[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
