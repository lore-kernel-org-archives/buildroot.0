From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Aug 2015 12:04:09 +0100
Subject: [Buildroot] [PATCH] package/tn5250: fix static linking problem
In-Reply-To: <20150826103248.GH8919@tarshish>
References: <1440579591-23594-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150826090804.GG8919@tarshish> <55DD824B.6030700@imgtec.com>
 <20150826103248.GH8919@tarshish>
Message-ID: <55DD9D29.6090308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 08/26/2015 11:32 AM, Baruch Siach wrote:
> Hi vincente,
> 
> On Wed, Aug 26, 2015 at 10:09:31AM +0100, Vicente Olivert Riera wrote:
>> On 08/26/2015 10:08 AM, Baruch Siach wrote:
>>> On Wed, Aug 26, 2015 at 09:59:51AM +0100, Vicente Olivert Riera wrote:
>>>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>>> +TN5250_CONF_ENV += LIBS="-lssl -lcrypto -lz"
>>>
>>> Please use pkg-config. See package/vsftpd/vsftpd.mk for example.
>>
>> that was my first approach and it didn't work. Does it work for you?
> 
> Please try http://patchwork.ozlabs.org/patch/510797/. Works for me :-).
> 
> baruch
> 

yeah, that one works. I was missing "libcrypto". But, I don't understand
why do you need to put libcrypto manually since it's already listed in
the openssl.pc file, and then libcrypto pulls libz. Doesn't work
recursively?

Regards,

Vincent.
