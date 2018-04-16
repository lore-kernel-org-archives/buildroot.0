From: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Date: Mon, 16 Apr 2018 18:06:39 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: qt5websockets: install missing qml
 modules
In-Reply-To: <20180416174832.0f092c09@windsurf.numericable.fr>
References: <3fc9a546-61c8-d7bf-f0eb-b757cae0dfe2@ginzinger.com>
 <20180416174832.0f092c09@windsurf.numericable.fr>
Message-ID: <4dd15cf2-ec3b-6e94-36a3-de61d649191e@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 2018-04-16 17:48, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for your contribution!
Thanks for maintaining ;-)

> 
> On Wed, 11 Apr 2018 14:40:37 +0200, Manfred Schlaegl wrote:
>> QML modules for QtWebSockets are located in /usr/qml/QtWebSockets since
>> Qt 5.5.
>>
>> /usr/qml/Qt/WebSockets still exists for compatibility reasons, but
>> it contains only a qmldir file which points to ../../QtWebSockets/.
> 
> Does this mean we should remove the installation
> of /usr/qml/Qt/WebSockets ?

Newer projects (since Qt5.5) use
{{{
import QtWebSockets 1.0
}}}
which translates to /usr/qml/QtWebSockets
-> This is, what was missing.

Older projects (prior Qt5.5) use
{{{
import Qt.WebSockets 1.0
}}}
which resolves to /usr/qml/Qt/WebSockets
-> We don't want to break them, so we have to keep /usr/qml/Qt/WebSockets.

In short: We have to keep it. ;-)

> 
> I've applied your patch to master as-is, anyway. Thanks!
> 
> Thomas
> 
Thanks!

Best regards,
Manfred
