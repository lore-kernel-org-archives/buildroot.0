From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 21 Jun 2018 10:25:55 +0200
Subject: [Buildroot] [RFC 1/1] support: add qt5bump script
In-Reply-To: <20180620175848.ttom7pvqsqdj4x65@archlinux>
References: <20180619022835.32530-1-gael.portay@savoirfairelinux.com>
 <56b3f748-6f38-fea7-9e83-14699817b73e@armadeus.com>
 <20180620175848.ttom7pvqsqdj4x65@archlinux>
Message-ID: <585ece8d-abed-03bd-8647-6718b4e541fa@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ga?l,

On 06/20/2018 07:58 PM, Ga?l PORTAY wrote:
> Hi S?bastien,
> 
> On Wed, Jun 20, 2018 at 06:36:23PM +0200, S?bastien Szymanski wrote:
>> Hi,
>>
>> On 06/19/2018 04:28 AM, Ga?l PORTAY wrote:
>>> (...)
>>
>> Last time I bumped a Qt version, I was surprised that Buildroot hasn't
>> such a script and I wrote one too but definitely not as good as yours ! :-)
>>
> 
> Thanks ;)
> 
>> I tried your script on the 2018.02.x branch to bump Qt to 5.9.6. It
>> ended with the following error:
>>
>> make: *** empty string invalid as file name.  Stop.
>>
> 
> Did you managed to understand why it ended with such error? I have never
> met that issue.
> 

I called the script like this:

$ ./support/scripts/qt5bump 5.9.6

so "${O:+O=$O}" in the xargs call is empty.

Removing the double quotes make it works.

Regards,

-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
