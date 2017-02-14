From: LogiSch17 <logi.tss@hotmail.de>
Date: Tue, 14 Feb 2017 05:43:18 -0800 (PST)
Subject: [Buildroot] Shell scripts does not emit finished() to QProcess
In-Reply-To: <ce6994a6-76f7-a075-51b6-e80dc306cdd8@gmail.com>
References: <1486997512738-156891.post@n4.nabble.com>
 <ce6994a6-76f7-a075-51b6-e80dc306cdd8@gmail.com>
Message-ID: <1487079798716-157008.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I guess now that the problem could be because I have my /var on a data
partition.
I created a complete image with the following partition tabel:
1 boot /boot
2 fs1 /
3 fs2
4 data /var

the second fs is cause i have a function where I update whole fs.ext4 to the
second fs partition and change the config.txt  on boot to mmcblk0p3.

And i changed the partition table at the same commit as i updated to
buildroot 2016.11. Afterwards the QProcess was never finished.

So i think there could be the problem with the /var. Does that make any
sense?

This is how my genimage looks like:



And i mount the /var in fstab, which i have at overlay.








--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Shell-scripts-does-not-emit-finished-to-QProcess-tp156891p157008.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
