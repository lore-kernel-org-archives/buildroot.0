From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Feb 2019 08:52:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcurl: introduce a 'small'
 config option
In-Reply-To: <CAAXf6LUxnkbW_gf6URLaVviJQzZNN8KonMpkzC_xKMCXrWa4PA@mail.gmail.com>
References: <20190206191305.18306-1-patrickdepinguin@gmail.com>
 <20190206203207.0dc09362@windsurf>
 <CAAXf6LUxnkbW_gf6URLaVviJQzZNN8KonMpkzC_xKMCXrWa4PA@mail.gmail.com>
Message-ID: <be3f5303-ad4d-14ed-a408-06828acddc24@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/02/2019 21:18, Thomas De Schampheleire wrote:
> El mi?., 6 feb. 2019 a las 20:32, Thomas Petazzoni
> (<thomas.petazzoni@bootlin.com>) escribi?:
>>
>> Hello,
>>
>> On Wed,  6 Feb 2019 20:13:05 +0100
>> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>>
>>> +config BR2_PACKAGE_LIBCURL_SMALL
>>> +     bool "disable non-basic features to reduce size"
>>> +     help
>>> +       Compile libcurl only with basic features enabled, to save
>>> +       about 50 KiB in the root filesystem.
>>> +
>>> +       Following protocols/features are disabled:
>>> +       - LDAP / LDAPS
>>> +       - POP3 / IMAP / SMTP
>>> +       - Telnet
>>> +       - TFTP
>>> +       - RTSP
>>> +       - SMB / CIFS
>>> +       - DICT
>>> +       - Gopher
>>> +       - Proxy support
>>> +       - Cookie support
>>
>> Discussing with Yann, we think that it would make sense to keep Proxy
>> support and Cookie support, which are both kind of expected for curl as
>> a tool for HTTP interaction. All the other features are not HTTP
>> related, so indeed it makes sense to disable them in this "small"
>> variant.
> 
> 
> I understand your reasoning, but note that both together amount to
> about 25KB which is roughly half of what the 'small' feature saves
> today.
> 
> Also, while cookies may be needed when interacting with 'real'
> websites, you would not normally need them to download standard files
> from a web server.
> 
> Perhaps, we should introduce separate options for cookie (10 KB) and
> proxy (15 KB), given their size? I.e. three new options?

 That sounds acceptable to me.

 Regards,
 Arnout
