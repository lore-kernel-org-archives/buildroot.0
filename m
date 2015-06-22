From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 22 Jun 2015 13:26:48 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be>
 <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be>
 <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be>
 <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
 <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
Message-ID: <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-06-22 12:50, Samuel Martin a ?crit?:
>>> - a first patch that removes the export of VERBOSE, with the commit 
>>> log
>>> explaining how it breaks cmake projects;
> 
> Does this mean that the VERBOSE env. var. should now be handled by the
> cmake-infra?

No, you can still build with "make VERBOSE=1" and CMake will take it 
into account.
There is nothing to change in cmake-infra.

The patch only prevents from systematically exporting VERBOSE when 
empty, which has a specific meaning for CMake - intentional or not, I 
don't know.


-- 
C?dric
